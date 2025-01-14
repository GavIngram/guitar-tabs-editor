import React, {Component} from 'react';

// Import custom components
import Chord from '../Chord/Chord';

// Import all chords
import chords from '../../assets/dataSource/chords';

// Import playchord dataSource
import playchord from '../../assets/dataSource/playchord';

// Import custom styles
import './styles.css';

class Helper extends Component {
  cancel = () => {
    this.props.toggleHelper();
  };

  render() {
    return (
      <div className='ge-helper'>
        <div className='ge-helper-chords'>
          <h1>Guitar Chords Helper</h1>
          <hr />
          {chords.map((chord) => (
            <button className='ge-chord-link' onClick={() => playchord(chord.name)} key={chord.name}>
              <Chord key={chord.name} chord={chord} />
            </button>
          ))}
        </div>

        <img onClick={this.cancel} className='ge-helper-cancel-btn' src={require('../../assets/icon/Cancel.png')} alt='Cancel' />
      </div>
    );
  }
}

export default Helper;
