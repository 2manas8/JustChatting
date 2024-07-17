const mongoose = require('mongoose')

const MessageSchema = new mongoose.Schema({
    roomId: String,
    sender: String,
    message: String,
    timeStamp: {
        type: Date,
        default: Date.now
    }
})

const Message = mongoose.model('MessageCollection', MessageSchema)

module.exports = Message