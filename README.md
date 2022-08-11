# Titanfall-chat-filter

Change the mod.json for your liking
#
words is a collection of all the words that you do not want in your chat seperate them by a "," with no " " in between <br />
#
Block is a boolean for wether you would like to block message with one (or more) of the offensive words, if this is set to false the message will be sent to the chat but it will replace the word with "*" <br />
#
ShouldInformPlayer is a boolean that determins if the player who has send the message with an offensive word gets notified of the block/alteration of his message <br />
#
ResponseOnBlock is the message the player will recive if Block is true and ShouldInformPlayer is true <br />
#
ResponseOnReplace is the message that the player will get if Block is false and ShouldInfromPlayer is true <br />
#
ShouldShameUnfriendlyPlayer is a boolean that determines if a message is sent to the chat that looks like the player who wrote the offensive message send <br />
#
MessageToShamePlayers is the message that will look like the player who send the original offensive message wrote, preferable this should make them look bad <br />
