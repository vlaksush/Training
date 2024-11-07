//: [Previous](@previous)

/*:
# SwiftLens: Weak vs Unowned References

Karan: "Naina, I'm a bit confused about when to use weak and when to use unowned. Can you explain?"

Naina: "Sure, Karan! Let's break it down with some SwiftLens examples."

## Weak References

Use weak when the referenced object might become nil during its lifetime.

Example:
*/

class Photo {
    let name: String
    weak var editor: PhotoEditor?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name) is being deinitialized") }
}

class PhotoEditor {
    let name: String
    var currentPhoto: Photo?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("PhotoEditor \(name) is being deinitialized") }
}

do {
    let photo = Photo(name: "Taj Mahal Sunset")
    let editor = PhotoEditor(name: "Karan")
    
    photo.editor = editor
    editor.currentPhoto = photo
}
print("End of scope")

/*:
Karan: "I see! We use weak for the editor property in Photo because an editor might not always be editing a photo."

Naina: "Exactly! The photo can exist without an editor, so it's okay if editor becomes nil."

## Unowned References

Use unowned when you're sure the referenced object will always exist as long as the object holding the reference exists.

Example:
*/

class Photographer {
    let name: String
    var camera: Camera?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("Photographer \(name) is being deinitialized") }
}

class Camera {
    let model: String
    unowned let owner: Photographer
    
    init(model: String, owner: Photographer) {
        self.model = model
        self.owner = owner
    }
    
    deinit { print("Camera \(model) is being deinitialized") }
}

do {
    let photographer = Photographer(name: "Naina")
    photographer.camera = Camera(model: "DSLR Pro", owner: photographer)
}
print("End of scope")

/*:
Naina: "Here, we use unowned for the owner property in Camera because a camera will always have an owner in our app."

Karan: "I get it! The camera can't exist without a photographer, so we're sure the owner will always be there."

## Key Differences:

1. Weak references become nil when the object they reference is deallocated. Unowned references don't.
2. Weak is safer when you're not sure if the referenced object will always exist.
3. Unowned is slightly more performant but can cause crashes if used incorrectly.

Naina: "Remember, Karan, if in doubt, use weak. It's safer!"

Karan: "Thanks, Naina! This really helps with our memory management in SwiftLens."
*/

/*:
To summarize when to use weak and unowned:

1. Use weak when:
   - The referenced object might become nil during its lifetime.
   - You're not sure if the referenced object will always exist.
   - In parent-child relationships where the parent might outlive the child.

2. Use unowned when:
   - You're certain the referenced object will always exist as long as the object holding the reference exists.

The key is to consider the lifecycle of your objects. If there's any chance the referenced object might become nil, use weak. If you're absolutely certain it will always exist (and you're willing to have your app crash if you're wrong), you can use unowned.

In the context of SwiftLens:
- Weak might be used for things like temporary editors of photos, current displays in a museum tour, or optional user settings.
- Unowned might be used for permanent relationships like a camera's owner, a monument's location, or a museum's curator.
*/

//: [Next](@next)
