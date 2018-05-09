This Docker Workshop was created with [reveal.js ](https://github.com/hakimel/reveal.js).

## Table of contents

- [Full setup](#full-setup)

## Full setup

Some reveal.js features, like external Markdown and speaker notes, require that presentations run from a local web server. The following instructions will set up such a server as well as all of the development tasks needed to make edits to the reveal.js source code.

1. Install [Node.js](http://nodejs.org/) (4.0.0 or later)

1. Clone the workshop repository
   ```sh
   $ git clone git@github.com:marcossantiago/docker-workshop.git
   ```

1. Navigate to the docker-workshop folder
   ```sh
   $ cd docker-workshop
   ```

1. Install dependencies
   ```sh
   $ npm install
   ```

1. Serve the presentation and monitor source files for changes
   ```sh
   $ npm start
   ```

1. Open <http://localhost:8000> to view your presentation

   You can change the port by using `npm start -- --port=8001`.