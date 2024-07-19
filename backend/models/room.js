const mongoose = require('mongoose')

const RoomSchema = new mongoose.Schema({
    members: [{
        type: mongoose.Schema.ObjectId,
        ref: 'UserCollection',
        required: true
    }]
})

const Room = mongoose.model('RoomCollection', RoomSchema)

module.exports = Room