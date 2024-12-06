import ErrorPage from "./pages/ErrorPage.vue";
import HomePage from "./pages/HomePage.vue";
import RegisterPage from "./pages/RegisterPage.vue";
import LoginPage from "./pages/LoginPage.vue";
import ProfilePage from "./pages/ProfilePage.vue";
import FriendsPage from "./pages/FriendsPage.vue";
import SettingsPage from "./pages/SettingsPage.vue";
import ModesPage from "./pages/ModesPage.vue";
import PongPage from "./pages/PongPage.vue";

export const routes = [
    {path: "/:pathMatch(.*)*", component: ErrorPage},
    {path: '/', component: HomePage, name: 'home'},
    {path: '/register', component: RegisterPage},
    {path: '/login', component: LoginPage},
    {path: "/profile/:username", component: ProfilePage},
    {path: "/friends", component: FriendsPage},
    {path: "/settings", component: SettingsPage},
    {path: "/modes", component: ModesPage},
    {path: "/modes/pong", component: PongPage}
]
