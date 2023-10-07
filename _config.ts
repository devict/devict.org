import lume from "lume/mod.ts";
import attributes from "lume/plugins/attributes.ts";
// import favicon from "lume/plugins/favicon.ts";

const site = lume();

site.ignore(
  "README.md",
  // Old hugo files
  "newsletter",
  "resources",
  "static",
  "public",
  "content",
  "layouts",
  "archetypes"
);

site.copy("static", ".");

site.use(attributes());
// site.use(favicon());

export default site;
