const express = require('express')
const router = express.Router()

const {chatHistory} = require('../controller/chat_history')
router.get('/chat_history', chatHistory)

const {deleteChat} = require('../controller/delete_chat')
router.delete('/delete_chat', deleteChat)

module.exports = router