# Cats

Cats is a simple rails app created with tests first that serves an API for a website with information about cats. It was made as homework, part of _The Iron Yard_ course.

## About the code

There are not html views in the code, and requests only respond to json format. At the moment, this are the routes that can consume information from the API.

- /cats list of all cats and their information and images url.
- /cats/:id show a particular cat with its information and image url.

Travis and Codeclimate have been set up for this project, their results can be seen next to the title.

## To Do

This is a work in progress, the next steps are:

- Refactor some test and template methods to be DRY.
- Fix a bug that shows the whole element for a cat instead of just the image url.
- Add links to the different API routes to be able to access all information just knowing a route.