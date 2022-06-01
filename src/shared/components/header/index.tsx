import { Link } from 'react-router-dom';
import { Block } from './styles';

export const Header = () => {
  return (
    <Block>
      <nav>
        <Link to="/settings">contract</Link>
        <Link to="/wallet">contract</Link>
        <Link to="/contract">contract</Link>
      </nav>
    </Block>
  );
};
