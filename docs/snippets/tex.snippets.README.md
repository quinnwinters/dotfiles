## tex.snippets 

The TeX language snippets (targeted at NeoVim/LaTeX editing workflows) are located
in the snippets directory in `tex.snippets`

### General Strucure

For the snippets, they are optimized so that a lot of them use regex capture groups
and a python engine to aid in auto complete. The advantage of this is that you have
more powerful string formatting capabilities in Python. For example, there is a
function in the global definition called `labelify` which takes a short title and
turns it into a label ready title (i.e. kebob case)

Additionally snippets are marked with contexts for when they should activate based
on the results of the function `vimtex#syntax#in_<env-name>()`. Notably, this means
that THESE SNIPPETS EXPLICITLY DEPEND ON VIMTEX. If you don't have vimtex installed
do not expect these snippets to work at all. 

### Some snippet highlights: 

For the full set of snippets, please refer to the file directly.  

#### Standard LaTeX snippets

A standard set of packages for Mathematics documents is included in `%StandardHeader`. 
Other than that, `mm` gives inline math mode, `dm` gives display math blocks, and 
there are some basic shortcuts to auto-expand phrases like `begin`, `table` and `figure`
into tab-able chunks. 

#### Theorem/Code/Environment snippets

Theorems are handled by `ntheorem` package and code is handled by `minted` (this
does mean that if you want to include code in you document, you need to install
pygmatize using `pip` for whatever python environment your snippet engine uses). 

There are two options for styling your theorems: `%AmsTheoremsHeader` and `%FramedTheoremsHeader`
To see what these look like, the [article](https://github.com/qwinters/texwork-template/blob/918edd7a216d1acb560e828a081ee07ff87e45d4/sample-pdfs/article.pdf) 
and [course](https://github.com/qwinters/texwork-template/blob/918edd7a216d1acb560e828a081ee07ff87e45d4/sample-pdfs/course.pdf)
sample PDFs linked use the AMS style and Framed style headings respectively. 

The following environments are defined by default for ntheorem: `definition`, `theorem`,
`lemma`, `proposition`, `corollary`, `example`, `counterexample` `axiom`, `property`,
`properties`, `exercise`, `problem`, `conjecture`, `remark`, `claim`, `note`, `notation`

These theorems can be created quickly using two LaTeX captures:
* `(symb):(label);` - Creates a theorem-typoe environment with a label
* `(symb):(label):(notes);` - Creates a theorem with notes (e.g. citations, theorem name)

For a full list of symbols and their resulting environment, please refere to [tex.snippets](https://github.com/qwinters/dotfiles/blob/162b9c40491d8762fb2da31d94ec668f23234bf2/snippets/tex.snippets#L51)

In addition to the `ntheorem` environments, there is a proof environment provided
that is "bold" in the sense that it leaves a line between the proof name and the 
content, and a line between the last of the content and the QED symbol. This should
hopefully help it stand out more visually. 

For code, the package `minted` is used. Environments are setup by default for a
number of different languages (see: [minted portion of snippets](https://github.com/qwinters/dotfiles/blob/162b9c40491d8762fb2da31d94ec668f23234bf2/snippets/tex.snippets#L816)). 

#### Math snippets

There are a lot of math snippets (which are all rightfully restricted to math mode). 

Here are just a brief overview of some of the snippets that auto-expand unprompted
* Greek letters auto-expand at the start of a word when written as `g(2-letter-abbrev)`, 
  e.g. `gaa` autocompletes to `\alpha`. For a full list of abbreviations, see [`greek_shorthand_map`](https://github.com/qwinters/dotfiles/blob/162b9c40491d8762fb2da31d94ec668f23234bf2/snippets/tex.snippets#L137)
* Math symbols (that don't often require sub- or super-scripts) auto-expand at the
  Start of a word when written as `m(2or3-letter-abbrev)`, e.g. `mnb` autocomplets to `\nabla`. 
  For a full list of abbreviations see [`math_symb_shorthand_map`](https://github.com/qwinters/dotfiles/blob/162b9c40491d8762fb2da31d94ec668f23234bf2/snippets/tex.snippets#L204)
* Blackboard bold reserved letters and Mathcal reserved letters auto expand by using
  their capital letter twice e.g. `RR` gives `\mathbb{R}`. The specific blackboard
  bold letters are R, C, Q, Z, N, E, P, U, H, D, and S. The specific mathcal letters
  are A, L, F, G, B, M,  X, and Y
* In addition to the reserved letters, `bb[A-Z]` and `cc[A-Z]` at the start of a 
  word will auto expand to the mathbb and resp. mathcal version of the letter.
  `ff` can also be used if you want to get mathfrak lettering for some reason 
* `1in` will put `\mathbbm{1}` for the indicator function of a set. 
  
  

Now there are more symbols that auto-expand when adding a `;` to the end of a regex. 
The rationale is that you almost never use `;` when writing mathematics, so let's 
use it as an easier to reach snippet trigger (e.g. as opposed to having to hit Tab). 
In general think of each of these as a function with a trigger word, a number of 
arguments separated by `:` and then a close to the arugments with `;`.  
* Convergence symbols are given by either `to;` (standard), `to:(symb);` (e.g. `to:TV;`
  will give `\overset{\|\cdot\|_{\text{TV}}}{\longrightarrow}` to indicate convergence
  in the Total Variation norm. Full list of symbols in the [`convergence_types_map`](https://github.com/qwinters/dotfiles/blob/162b9c40491d8762fb2da31d94ec668f23234bf2/snippets/tex.snippets#L267)) 
  or `to:(arg1):(arg2);` which will give `\overset{(arg1) \to (arg2)}{\longrightarrow}`
  to indicate convergence in a specific limit, or  `\overset{\substack{\text{when}}{(arg2)}}{\longrightarrow}`
  when your first argument starts with a "wh" (e.g. to indicate conditional convergence)
* Derivatives and partial derivatives are auto-expanded using the convention that `d(arg1)d(arg2);`
  means you want to differentiate `arg1` wiht respect to `arg2` (and for partial 
  derivatives just use `p` instead of `d`). `arg1` is optional as well e.g. if you
  write `ddt;` the snippet will give you `\frac{d}{dt}`
* Sums, products, integrals, etc. are all supported with three different options
  for expantion. `symb;` will give you the raw symbol, `symb:arg;` will give you 
  the symbol with just a subscript (e.g. for Lesbesgue style integrals), and 
  `symb:arg1:arg2;` will give you the symbol with a `arg1` as a subscript and 
  `arg2` as the super script (e.g. to integrate over an interval)
* Limit (including limsup, liminf), inf/sup/min/max are supported in a similar
  way with three options: plain (e.g. `linf;` => `\liminf`), subscripted (e.g. `min:x\in A;`
  => `\min_{x\in A}`), and set-builder style (e.g. `inf:t>0:x\in tK;` => `\inf\left\{t>0\;\middle|\;x\in tK\right}`)
  Additionally there is a stacked version achieved by appending `_stack` to the 
  symbol (e.g. `min_stack:x\in B_2:\text{Im}(x)>0;` => `\min_{\substack{x\in B_2}{\text{Im}(x)>0}}`)
* A large number of functions and mathematical operators are supported with automatic
  left-right parenthesis balancing e.g. `vol:K + \frac{\delta}{2}B_2;` will autoexpand
  to `\text{vol}\left(K +\frac{\delta}{2}B_2\right)`. For a full list, see the snippets
  file's [entire section on them](https://github.com/qwinters/dotfiles/blob/162b9c40491d8762fb2da31d94ec668f23234bf2/snippets/tex.snippets#L1132).
    * Of particular note, arbitrary norms are supported with the function name in 
      the form of `(TEXT)norm` where specific text (e.g. `LP` codes for a pre-determined
      suffix based on the [`left_right_notation`](https://github.com/qwinters/dotfiles/blob/162b9c40491d8762fb2da31d94ec668f23234bf2/snippets/tex.snippets#L355)
      map.)
    * Note that there are also options for left/right/middle-type functions here
      e.g. using `dirac:\phi:\psi;` will give `\left\langle \phi\;\middle|\; \psi\right\rangle`
* Automated suffix expansion for common suffixes, e.g. `Ahat` becomes `\hat{A}`. (see: [suffixes](https://github.com/qwinters/dotfiles/blob/162b9c40491d8762fb2da31d94ec668f23234bf2/snippets/tex.snippets#L452))
* Automated root and fraction environments which are trigged as suffixes i.e. 
   `|\nabla f| - \mathbb{E}|\nabla f|:root:2;` will autoexpand to `\sqrt{|\nabla f| - \mathbb{E}|\nabla f|}`. 
   It is intelligent about when to use `\sqrt` and when to use `\left( arg \right)^{\frac{1}{root}}`. 
   For complex fractional powers, you can also provide both a numerator and denomenator
* Fractions can be done with `//` or the standard of `frac:arg1:arg2;`
* Row and column vectors are done as functions of user given args, where they take
  one arugment that is their content. The input to these functions will be split on ":" and
  each ":" separated value will be a different entry. Otherwise you can use `matrix`
  to get a normal enviroment. You can prefix any of these to with `b` to get a 
  square braket vector/matrix (instead of one with parenthesis)
   
   
Do note that the regexes are greedy so matching migth give unexpected results if 
you are using two different snippets on the same line and don't remember which one 
is higher priority.
