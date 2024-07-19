const express = require('express')
const router = express.Router()

const {chatRoom} = require('../controllers/chat_room')
router.post('/chat_room', chatRoom)

const {chatHistory} = require('../controllers/chat_history')
router.get('/chat_history', chatHistory)

const {deleteChat} = require('../controllers/delete_chat')
router.delete('/delete_chat', deleteChat)

module.exports = router