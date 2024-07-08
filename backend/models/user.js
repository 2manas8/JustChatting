const mongoose = require('mongoose')

const UserSchema = new mongoose.Schema({
    name: {
        type: String,
        required: [true, 'Name is required']
    },
    username: {
        type: String,
        required: [true, 'Username is required']
    },
    email: {
        type: String,
        required: [true, 'E-mail is required']
    },
    phone: {
        type: String,
        required: [true, 'Phone number is required']
    },
    password: {
        type: String,
        required: [true, 'Password is required']
    }
})

const User = mongoose.model('UserCollection', UserSchema)

module.exports = User