import CreditsPage from "./pages/CreditsPage.vue";
import ErrorPage from "./pages/ErrorPage.vue";
import HomePage from "./pages/HomePage.vue";
import LoginPage from "./pages/LoginPage.vue";
import RegisterPage from "./pages/RegisterPage.vue";

export const routes = [
    {path: '/', component: HomePage, name: 'home'},
    {path: '/credits', component: CreditsPage},
    {path: '/register', component: RegisterPage},
    {path: '/login', component: LoginPage},
    {path: "/:pathMatch(.*)*", component: ErrorPage},
]
