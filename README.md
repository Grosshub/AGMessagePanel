# AGMessagePanel

Extendable and easy to use text area for chat. 
With AGMessagePanel framework it's easy to setup a full functional text area for messengers in few lines of code.
You could configure the text area placeholder, number of max lines when text is growing, left or right buttons to send a message or to attach a file to your message.

### Main UI components:
 * `transparent area view` - define the top transparent areat before the message panel
 * `message area view` - define the message area that includes text view, left and right buttons
 * `message panel controller` - main controller that handles a message panel view. Should be inherited in your own class to overwrite methods which manages a functionalities you want to control
 
### Architecture

##### Core
* `ViewControllers` - contains message panel controller specializes in managing a message panel view 
* `Views` - message panel views
* `Constants` - defines different types of message panel (with or without left or right buttons)

## Authors
* **Alexey Gross** - [alexey.gross][AG]

[AG]: https://github.com/grosshub
