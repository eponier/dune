  $ export BUILD_PATH_PREFIX_MAP=\
  > "OPAM_PREFIX=$(ocamlc -where):$BUILD_PATH_PREFIX_MAP"

If Merlin field is absent, default context is chosen

  $ cat >dune-workspace <<EOF
  > (lang dune 2.9)
  > (context (default))
  > (context
  >  (default
  >   (name cross)))
  > EOF

  $ dune build

  $ [ ! -d _build/cross/.merlin-conf ] && echo "No config in cross"
  No config in cross

  $ ls -a _build/default/.merlin-conf
  .
  ..
  lib-foo

  $ dune ocaml merlin dump-config "$PWD"
  Foo: _build/default/foo
  ((INDEX
    $TESTCASE_ROOT/_build/default/.foo.objs/cctx.ocaml-index)
   (STDLIB OPAM_PREFIX)
   (SOURCE_ROOT
    $TESTCASE_ROOT)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/default/.foo.objs/byte)
   (S
    $TESTCASE_ROOT)
   (FLG
    (-w
     @1..3@5..28@30..39@43@46..47@49..57@61..62-40
     -strict-sequence
     -strict-formats
     -short-paths
     -keep-locs
     -g))
   (UNIT_NAME foo))
  Foo: _build/default/foo.ml
  ((INDEX
    $TESTCASE_ROOT/_build/default/.foo.objs/cctx.ocaml-index)
   (STDLIB OPAM_PREFIX)
   (SOURCE_ROOT
    $TESTCASE_ROOT)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/default/.foo.objs/byte)
   (S
    $TESTCASE_ROOT)
   (FLG
    (-w
     @1..3@5..28@30..39@43@46..47@49..57@61..62-40
     -strict-sequence
     -strict-formats
     -short-paths
     -keep-locs
     -g))
   (UNIT_NAME foo))

If Merlin field is present, this context is chosen

  $ cat >dune-workspace <<EOF
  > (lang dune 2.8)
  > (context (default))
  > (context
  >  (default
  >   (name cross)
  >   (merlin)))
  > EOF

  $ dune build

  $ ls -a _build/cross/.merlin-conf
  .
  ..
  lib-foo

  $ [ ! -d _build/default/.merlin-conf ] && echo "No config in default"
  No config in default

  $ dune ocaml merlin dump-config "$PWD"
  Foo: _build/cross/foo
  ((INDEX
    $TESTCASE_ROOT/_build/cross/.foo.objs/cctx.ocaml-index)
   (STDLIB OPAM_PREFIX)
   (SOURCE_ROOT
    $TESTCASE_ROOT)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/cross/.foo.objs/byte)
   (S
    $TESTCASE_ROOT)
   (FLG
    (-w
     @1..3@5..28@30..39@43@46..47@49..57@61..62-40
     -strict-sequence
     -strict-formats
     -short-paths
     -keep-locs
     -g))
   (UNIT_NAME foo))
  Foo: _build/cross/foo.ml
  ((INDEX
    $TESTCASE_ROOT/_build/cross/.foo.objs/cctx.ocaml-index)
   (STDLIB OPAM_PREFIX)
   (SOURCE_ROOT
    $TESTCASE_ROOT)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/cross/.foo.objs/byte)
   (S
    $TESTCASE_ROOT)
   (FLG
    (-w
     @1..3@5..28@30..39@43@46..47@49..57@61..62-40
     -strict-sequence
     -strict-formats
     -short-paths
     -keep-locs
     -g))
   (UNIT_NAME foo))

If `generate_merlin_rules` field is present, rules are generated even if merlin
is disabled in that context

  $ cat >dune-workspace <<EOF
  > (lang dune 3.16)
  > (context (default))
  > (context
  >  (default
  >   (name cross)
  >   (generate_merlin_rules)))
  > EOF

  $ dune build

  $ ls -a _build/cross/.merlin-conf
  .
  ..
  lib-foo

  $ ls -a _build/default/.merlin-conf
  .
  ..
  lib-foo

  $ dune ocaml merlin dump-config "$PWD"
  Foo: _build/default/foo
  ((INDEX
    $TESTCASE_ROOT/_build/default/.foo.objs/cctx.ocaml-index)
   (STDLIB OPAM_PREFIX)
   (SOURCE_ROOT
    $TESTCASE_ROOT)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/default/.foo.objs/byte)
   (S
    $TESTCASE_ROOT)
   (FLG
    (-w
     @1..3@5..28@30..39@43@46..47@49..57@61..62-40
     -strict-sequence
     -strict-formats
     -short-paths
     -keep-locs
     -g))
   (UNIT_NAME foo))
  Foo: _build/default/foo.ml
  ((INDEX
    $TESTCASE_ROOT/_build/default/.foo.objs/cctx.ocaml-index)
   (STDLIB OPAM_PREFIX)
   (SOURCE_ROOT
    $TESTCASE_ROOT)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/default/.foo.objs/byte)
   (S
    $TESTCASE_ROOT)
   (FLG
    (-w
     @1..3@5..28@30..39@43@46..47@49..57@61..62-40
     -strict-sequence
     -strict-formats
     -short-paths
     -keep-locs
     -g))
   (UNIT_NAME foo))
