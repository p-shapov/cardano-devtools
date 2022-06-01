import { createContext, FC, ReactNode, useContext } from 'react';
import { Api } from 'services/api';

const initStore = () => {
  const api = new Api();

  return {
    api,
  } as const;
};

type ContextValue = ReturnType<typeof initStore>;

export const StoreContext = createContext<ContextValue | null>(null);

type Props = {
  children: ReactNode;
};

export const StoreProvider: FC<Props> = ({ children }) => {
  const store = initStore();

  return <StoreContext.Provider value={store}>{children}</StoreContext.Provider>;
};

export function useStore() {
  const store = useContext(StoreContext);

  if (store) return store;

  throw new Error('App initializing error');
}
