import { iconCardano } from 'assets/icons/cardano';
import { FC } from 'react';
import { Link, useLocation } from 'react-router-dom';

import classes from './header.module.scss';

const navUrls: Array<{ text: string; url: `/${string}` }> = [
  { text: 'Settings', url: '/' },
  { text: 'Wallet', url: '/wallet' },
  { text: 'Contract', url: '/contract' },
];

export const Header: FC = () => {
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
