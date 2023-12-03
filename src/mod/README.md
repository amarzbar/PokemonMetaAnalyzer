### Modularization

[Shiny modules](https://mastering-shiny.org/scaling-modules.html) Modules give you the ability to create controls that can only be seen from within the module. This is called a namespace because it creates “spaces” of “names” that are isolated from the rest of the app.

Shiny modules have two big advantages. Firstly, namespacing makes it easier to understand how your app works because you can write, analyse, and test individual components in isolation. Secondly, because modules are functions they help you reuse code; anything you can do with a function, you can do with a module.