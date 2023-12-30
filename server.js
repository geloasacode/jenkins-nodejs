const express = require('express');
const Port = 3333;

const app = express();

app.get("/", (req, res) => {
    res.send("<h1> Hello World </h1>")
});

app.listen(Port, () => {
    console.log(`App is listening on port: ${Port}`);
})