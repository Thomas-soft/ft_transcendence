import CreditsPage from "./pages/CreditsPage.vue";
import ErrorPage from "./pages/ErrorPage.vue";
import HomePage from "./pages/HomePage.vue";

export const routes = [
    {path: '/', component: HomePage, name: 'home'},
    {path: '/credits', component: CreditsPage},
    {path: "/:pathMatch(.*)*", component: ErrorPage},
]
