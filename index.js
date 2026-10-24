import express from "express"
import bodyParser from "body-parser";
import pg from "pg";
import dotenv from "dotenv";
dotenv.config({ path: "db.env" });

const app = express();
const port = 3000;

const db = new pg.Client({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: Number(process.env.DB_PORT)
})
db.connect()


app.use(bodyParser.urlencoded({ extended: true}))
app.use(express.json())
app.use(express.static("public"))

async function getList(){
    const result = await db.query("SELECT * FROM items")

    return result.rows
}

app.get ("/",async (req, res)=>{
    const final = await getList();
    res.render("index.ejs", {note: final})
})


app.post("/add", async(req, res)=>{
    const value = req.body.add;
    
    try {
        if(value.length === 0){
            return res.redirect("/")
        }
        await db.query("INSERT INTO items(title) VALUES($1)", [value])

        return res.redirect("/")
        
    } catch (error) {
        console.log(error)
        res.status(500).send("Error al agregar la tarea");
    }

})

app.put("/edit/:id", async (req, res)=>{
    try {
        const {title} = req.body;
        const id = req.params.id;

        await db.query("UPDATE items SET title=$1 WHERE id=$2",
            [title, id]
        )

        res.sendStatus(200)

    } catch (error) {
        console.log(error)
        res.sendStatus(500);
    }
})

app.delete("/delete/:id",async (req, res)=>{

    try {
        await db.query("DELETE FROM items WHERE id= $1", [req.params.id])

        res.sendStatus(200)
    } catch (error) {
        console.log(error)
        res.sendStatus(500);
    }
})


app.listen(port, ()=>{
    console.log(`Server is running on port ${port}`)
})