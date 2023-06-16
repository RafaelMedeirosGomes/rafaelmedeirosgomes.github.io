---
layout: post
title:  "You don't (always) need TypeScript"
date:   2023-06-16 15:00:00 -0300
categories: typescript jsdoc
---

When I heard about SvelteKit moving away from TypeScript and converting stuff to [JSDoc](https://jsdoc.app/about-getting-started.html) I got interested in exploring a little bit the API and see what it can do.

Turns out it is really simple: The setup as expected is super easy and the API is surprisingly clean. [You are still going to use your TypeScript Language Server for the type checking](https://www.typescriptlang.org/docs/handbook/intro-to-js-ts.html), but you only need a `// @ts-check` on the file you want to type check, or even better, create a `jsconfig.json` file with

{% highlight json %}
{
    "compilerOptions": {
        "checkJs": true,
        "module": "CommonJS",
        "moduleResolution": "node",
        "target": "ES2015"
    }
}
{% endhighlight %}

and you are good to go. No libraries to install and no files to transpile.

I ended up creating a [small project](https://github.com/RafaelMedeirosGomes/js-mealy-machine) to try out JSDoc and other ideas (maybe future posts about them). You can browse the project and see that you can easy define reusable types with `@typedef`, define inline types for your variables with `@type`, type function parameters with `@params` and so on, the API is rich and the names easy to remember. The only thing that I found out that is kinda kinda annoying is the tag `@template` used to make generic types, it just makes any generic type occupy multiple lines which is visual pollution in the code editor.

To start using `JSDoc` I recommend the docs in the TypeScript website, link [here](https://www.typescriptlang.org/docs/handbook/intro-to-js-ts.html). As always you can learn a lot by reading good code, have a look at [SvelteKit github repo](https://github.com/sveltejs/kit).