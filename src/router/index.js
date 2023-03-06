import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../page/Home.vue';
import Profile from '../page/Profile.vue';
import Upload from '../page/Upload.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/address/:address',
    name: 'Profile',
    component: Profile,
  },
  {
    path: '/upload',
    name: 'Upload',
    component: Upload,
  },
];

const router = new VueRouter({
  routes,
});

export default router;
