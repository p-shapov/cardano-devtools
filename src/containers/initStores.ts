import { Api } from 'servicies/api';

export const initStore = () => {
  const api = new Api();
  return {
    api,
  } as const;
};

export type Store = ReturnType<typeof initStore>;
