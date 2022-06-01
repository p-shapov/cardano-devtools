import { iconCardano } from 'assets/icons/cardano';
import { Link, useLocation } from 'react-router-dom';

import classes from './header.module.scss';

const navUrls = [
  { text: 'Settings', url: '/' },
  { text: 'Wallet', url: '/wallet' },
  { text: 'Contract', url: '/contract' },
];

export const Header = () => {
  const location = useLocation();

  return (
    <header className={classes['root']}>
      <div className={classes['logo']}>
        {iconCardano}
        <span>Cardano devtools</span>
      </div>
      <nav className={classes['nav']}>
        {navUrls.map(({ text, url }, i) => (
          <Link
            to={url}
            key={i}
            className={[classes['item'], location.pathname === url ? classes['item--active'] : ''].join(' ')}
          >
            {text}
          </Link>
        ))}
      </nav>
    </header>
  );
};
