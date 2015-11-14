local rednetReplys = {
    --[[{
        number channelFrom: Channel to listen on.
        string protocol: The protocol to listen for.
        function isReplying: Is this a reply?
        function onReply: Executed when a reply is sent, with parameters (message, id, protocol, sentMessageId)
    }]]--
}

function lines(txt)
    

function processRednet(msg, id, protocol)
    if string.sub(msg, 1, 18) == "POWERCORE HEADER:\n" then
        local endHeader = string.find(msg, "\n \n")
        local processing = string.sub(msg, 19, endHeader - 1)
