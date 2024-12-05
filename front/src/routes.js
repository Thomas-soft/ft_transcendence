import ErrorPage from "./pages/ErrorPage.vue";
import HomePage from "./pages/HomePage.vue";
import RegisterPage from "./pages/RegisterPage.vue";
import LoginPage from "./pages/LoginPage.vue";
import ProfilePage from "./pages/ProfilePage.vue";
import FriendsPage from "./pages/FriendsPage.vue";

export const routes = [
    {path: "/:pathMatch(.*)*", component: ErrorPage},
    {path: '/', component: HomePage, name: 'home'},
    {path: '/register', component: RegisterPage},
    {path: '/login', component: LoginPage},
    {path: "/profile/:username", component: ProfilePage},
    {path: "/friends", component: FriendsPage},
]
