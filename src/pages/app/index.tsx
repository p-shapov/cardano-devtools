import { useState } from 'react';
import { observer } from 'mobx-react-lite';
import { Navigate, Route, Routes } from 'react-router-dom';

import { initStore, StoreContext, Store } from 'containers';
import { Header } from 'shared/components/header';

import { Contract } from '../contract';
import {} from './styles';

export const App = observer(() => {
  const [store] = useState<Store>(() => initStore());

  return (
    <StoreContext.Provider value={store}>
      <div>
        <Header />
        <main>
          <Routes>
            <Route path="/" element="Main" />
            <Route path="/contract" element={<Contract />}>
              <Route path=":instanceId" element={<Contract />} />
            </Route>
            <Route path="/page-2" element="Page 2" />
            <Route path="/page-3" element="Page 3" />
            <Route path="/*" element={<Navigate to="/" replace />} />
          </Routes>
        </main>
      </div>
    </StoreContext.Provider>
  );
});
