import { createContext, useContext } from 'react';
import type { Store } from './initStores';

export const StoreContext = createContext<Store | null>(null);

export function useStore() {
  const store = useContext(StoreContext);
  if (store) {
    return store;
  }

  throw new Error('App initializing error');
}
