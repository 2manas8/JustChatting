require('dotenv').config()
const express = require('express')
const http = require('http')

const appPort  = process.env.APP_PORT || 3000
const app = express()
app.use(express.json())

const auth = require('./routes/authentication')
app.use('/api/v1/auth', auth)

app.listen(appPort, () => {
    console.log('Server is running at ' + appPort)
})

const dbConnect = require('./config/database')
dbConnect()

const socketHandler = require('./websockets/socket_handler')
const socketPort = process.env.WEBSOCKET_PORT || 4000
const server = http.createServer(app)
socketHandler(server)

server.listen(socketPort, () => {
    console.log('Web socket running at port ' + socketPort)
})

app.get('/', (req, res) => {
    res.send('Backend is running')
})