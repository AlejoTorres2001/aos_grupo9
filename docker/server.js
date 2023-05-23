const express = require('express')
const pathToSwaggerUi = require('swagger-ui-dist').absolutePath()
const app = express()
const PORT = 8080
app.use(express.static(pathToSwaggerUi))
app.listen(PORT)