function getServerTickTime()
    print("Um... finish this \"getServerTickTime()\"")
end

local repairActivate = {
    patterns = {
        {
            "^%d+$",
            "^%d+$",
            "^%d+$"
        },
        {
            "^%d+$"
        }
    },
    {
        "Kernel/data/keys/self/public",
        "Kernel/data/keys/self/private",
        "Kernel/data/keys/self/resetTime"
    },
    {
        "Kernel/data/keys/serverPublicKey"
    },
    repair = {
        function()
            os.loadAPI("Kernel/data/keys/api")
            local public, private = api.generateKeypair()
            os.unloadAPI("Kernel/data/keys/api")
            
            local publicFile = fs.open("Kernel/data/keys/self/public", "w")
            publicFile.write(public)
            fs.close(publicFile)
            
            local privateFile = fs.open("Kernel/data/keys/self/private", "w")
            privateFile.write(private)
            fs.close(privateFile)
            
            local resetFile = fs.open("Kernel/data/keys/self/resetTime", "w")
            resetFile.write(getServerTickTime())
            fs.close(resetFile)
        end,
        function()
            term.setBackgroundColor(16)
            term.clear()
            term.setCursorPos(1, 1)
            local newKey = io.read()
            
            local serverFile = fs.open("Kernel/data/keys/serverPublicKey", "w")
            serverFile.write(newKey)
            fs.close(serverFile)
        end
    }
}

--os.loadAPI("Kernel/data/keys/serverPublicKey")

os.loadAPI("Kernel/data/keys/self/public")
os.loadAPI("Kernel/data/keys/self/private")
os.loadAPI("Kernel/data/keys/self/resetTime")

function encryptDecrypt(

local rednetReplys = {
    --[[{
        number channelFrom: Channel to listen on.
        string protocol: The protocol to listen for.
        function isReplying: Is this a reply?
        function onReply: Executed when a reply is sent, with parameters (message, id, protocol, sentMessageId)
    }]]--
}

function processRednet(msg, id, protocol)
    if string.sub(msg, 1, 18) == "POWERCORE HEADER:\n" then
        local endHeader = string.find(msg, "\n \n")
        local processing = string.sub(msg, 19, endHeader - 1)
        for line in string.gmatch(processing, ".-\n") do
            local separatorStart, separatorEnd = string.find(line, "%s?:%s?")
            local key = string.sub(line, 1, separatorStart - 1)
            local value = string.sub(line, separatorEnd + 1)
            if key == "server announcement" then
                if value == "
