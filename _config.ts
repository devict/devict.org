import lume from "lume/mod.ts";
import attributes from "lume/plugins/attributes.ts";
// import favicon from "lume/plugins/favicon.ts";

const site = lume();

site.ignore("README.md", "static", "netlify.toml");

site.copy("static", ".");

site.use(attributes());
// site.use(favicon());

export default site;
