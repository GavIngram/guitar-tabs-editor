const chordDict = Object.keys(CHORD_COLLECTION).reduce((acc, chord) => {
  const oFirst = CHORD_COLLECTION[chord][0];
  if (oFirst !== null) {
    const arrPositions = oFirst.positions;
    if (arrPositions !== null) {
      acc[chord] = arrPositions.map((fret) => {
        if (fret === 'x') {
          return null;
        } else {
          // convert fret to number
          return fret * 1;
        }
      });
    }
  }
  return acc;
}, {});
