import { Routes } from '@angular/router';
import { adminGuard } from './guards/admin.guard';
import { AdminLocaliPageComponent } from './pages/admin-locali-page.component';
import { LoginPageComponent } from './pages/login-page.component';
import { NearbyPageComponent } from './pages/nearby-page.component';

export const routes: Routes = [
  {
    path: '',
    component: NearbyPageComponent
  },
  {
    path: 'nearby',
    component: NearbyPageComponent
  },
  {
    path: 'login',
    component: LoginPageComponent
  },
  {
    path: 'admin',
    pathMatch: 'full',
    redirectTo: 'admin/locali'
  },
  {
    path: 'admin/locali',
    component: AdminLocaliPageComponent,
    canActivate: [adminGuard]
  },
  {
    path: '**',
    redirectTo: ''
  }
];
