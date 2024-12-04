const express = require('express')
const app = express()
const port = 8000

app.get('/', (req, res) => {
    res.send('This is my Node application for CICD pipline')
})

app.listen(port, () => {
    console.log(`Application is listening at http://localhost:${port}`)
})
