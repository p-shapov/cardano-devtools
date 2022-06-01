import { observer } from 'mobx-react-lite';
import { Navigate, Route, Routes } from 'react-router-dom';
import { StoreProvider } from 'containers/context';
import { Header } from 'components/header';

import { Contract } from '../contract';

export const App = observer(() => {
  return (
    <StoreProvider>
      <div>
        <Header />
        <main>
          <Routes>
            <Route path="/" element="Main" />
            <Route path="/contract" element={<Contract />}>
              <Route path=":instanceId" element={<Contract />} />
            </Route>
            <Route path="/wallet" element="Wallet" />
            <Route path="/*" element={<Navigate to="/" replace />} />
          </Routes>
        </main>
      </div>
    </StoreProvider>
  );
});
