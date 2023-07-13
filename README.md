# Guitar-Editor

A portable guitar editor is coded based on react.js, inspired by Markdown and LaTex.

The chords and tab paragraphs components are based on `<svg/>` tech.

Two components that related to this projects are published to npm. If you are interested in how to develop a guitar chord with React.js, please check them

- [react-guitar-lyrics](https://github.com/Haixiang6123/react-guitar-lyrics)
- [react-chord-generator](https://github.com/Haixiang6123/react-chord-generator)

## Changes to this fork

- Dockerized
- Hacked together the ability to click on a text chord name and have it play the chord
  - I don't know react, so I hacked it using normal JS
  - Uses [this](https://codepen.io/johnslipper/pen/eYgZMRL)
  - Chord definitions are from [T-vK/chord-collection](https://github.com/T-vK/chord-collection/blob/master/chords.js)

## ScreenShot

![Home page](./Screenshots/Home.png)

![Preview page](./Screenshots/Preview.png)

![Tips pop](./Screenshots/Tips.png)

## How to run

### Docker

```bash
docker compose up
```

### Local

```bash
npm install

npm start
```

```bash
npm run build         # To build this project
```

## Future

This project is written in the period of my final week, so there are some parsing parts that are not the most optimized one.
For example, if you type really fast in the `<textarea/>` element, the editor might have some 'stuck' behaviors.

If you are interested in this guitar editor, please help me to improve the parsing part.
