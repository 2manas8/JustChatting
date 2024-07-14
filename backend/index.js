require('dotenv').config()
const express = require('express')
const http = require('http')

const port  = process.env.PORT || 3000
const app = express()
app.use(express.json())

const auth = require('./routes/authentication')
app.use('/api/v1/auth', auth)

const dbConnect = require('./config/database')
dbConnect()

const socketHandler = require('./websockets/socket_handler')
const server = http.createServer(app)
socketHandler(server)

server.listen(port, () => {
    console.log('Server and web socket running at port ' + port)
})

app.get('/', (req, res) => {
    res.send('Backend is running')
})