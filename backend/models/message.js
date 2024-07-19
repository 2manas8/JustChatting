const mongoose = require('mongoose')

const MessageSchema = new mongoose.Schema({
    roomId: String,
    sender: {
        type: mongoose.Schema.ObjectId,
        ref: 'UserCollection'
    },
    message: String,
    timeStamp: {
        type: Date,
        default: Date.now
    }
})

const Message = mongoose.model('MessageCollection', MessageSchema)

module.exports = Message