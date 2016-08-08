{ haskellPackages }:

with haskellPackages; [
  # additional packages (from stackage)
  AC-Vector
  BlastHTTP
  # BlogLiterately -- large
  # BlogLiterately-diagrams -- large
  Boolean
  BoundedChan
  Cabal
  # Cabal-ide-backend -- large
  # Chart -- large
  # Chart-cairo -- large
  ChasingBottoms
  DAV
  # DRBG -- large
  Decimal
  Diff
  FenwickTree
  # FontyFruity -- large
  # GLURaw -- large
  # GLUT -- large
  GenericPretty
  Glob
  GraphSCC
  # HCodecs -- large
  # HList -- large
  HStringTemplate
  # HTF -- large
  HTTP
  HUnit
  # HaTeX -- large
  # HaXml -- large
  # HandsomeSoup -- large
  # HaskellNet -- large
  HsOpenSSL
  IfElse
  # JuicyPixels -- large
  List
  ListLike
  MemoTrie
  # MissingH -- large
  MonadCatchIO-transformers
  MonadPrompt
  MonadRandom
  NumInstances
  ObjectName
  Octree
  # OpenGL -- large
  # OpenGLRaw -- large
  PSQueue
  QuasiText
  QuickCheck
  RSA
  # Rasterific -- large
  ReadArgs
  RefSerialize
  SHA
  SafeSemaphore
  # Spock -- large
  # Spock-digestive -- large
  # Spock-worker -- large
  StateVar
  TCache
  # Unixutils -- large
  Workflow
  # X11 -- large
  # Yampa -- large
  # YampaSynth -- large
  abstract-deque
  abstract-par
  # accelerate -- large
  # ace -- large
  action-permutations
  # active -- large
  # ad -- large
  adjunctions
  aeson
  aeson-better-errors
  aeson-pretty
  aeson-qq
  # aeson-schema -- large
  aeson-utils
  # agentx -- large
  alarmclock
  alex
  # amazonka -- large
  # amazonka-autoscaling -- large
  # amazonka-cloudformation -- large
  # amazonka-cloudfront -- large
  # amazonka-cloudhsm -- large
  # amazonka-cloudsearch -- large
  # amazonka-cloudsearch-domains -- large
  # amazonka-cloudtrail -- large
  # amazonka-cloudwatch -- large
  # amazonka-cloudwatch-logs -- large
  # amazonka-codedeploy -- large
  # amazonka-cognito-identity -- large
  # amazonka-cognito-sync -- large
  # amazonka-config -- large
  # amazonka-core -- large
  # amazonka-datapipeline -- large
  # amazonka-directconnect -- large
  # amazonka-dynamodb -- large
  # amazonka-ec2 -- large
  # amazonka-ecs -- large
  # amazonka-elasticache -- large
  # amazonka-elasticbeanstalk -- large
  # amazonka-elastictranscoder -- large
  # amazonka-elb -- large
  # amazonka-emr -- large
  # amazonka-glacier -- large
  # amazonka-iam -- large
  # amazonka-importexport -- large
  # amazonka-kinesis -- large
  # amazonka-kms -- large
  # amazonka-lambda -- large
  # amazonka-ml -- large
  # amazonka-opsworks -- large
  # amazonka-rds -- large
  # amazonka-redshift -- large
  # amazonka-route53 -- large
  # amazonka-route53-domains -- large
  # amazonka-s3 -- large
  # amazonka-sdb -- large
  # amazonka-ses -- large
  # amazonka-sns -- large
  # amazonka-sqs -- large
  # amazonka-ssm -- large
  # amazonka-storagegateway -- large
  # amazonka-sts -- large
  # amazonka-support -- large
  # amazonka-swf -- large
  # amazonka-workspaces -- large
  amqp
  annotated-wl-pprint
  ansi-terminal
  ansi-wl-pprint
  appar
  applicative-quoters
  approximate
  # arbtt -- large
  arrow-list
  # asciidiagram -- large
  asn1-encoding
  asn1-parse
  asn1-types
  async
  attoparsec
  attoparsec-enumerator
  attoparsec-expr
  authenticate
  authenticate-oauth
  # auto -- large
  auto-update
  # aws -- large
  # bake -- large
  bank-holidays-england
  base-compat
  base-orphans
  base-prelude
  base-unicode-symbols
  base16-bytestring
  base32string
  base58string
  base64-bytestring
  base64-string
  basic-prelude
  bcrypt
  bencode
  bifunctors
  binary-conduit
  binary-list
  bindings-DSL
  bioace
  bioalign
  biocore
  biofasta
  biofastq
  biopsl
  bits
  bitwise
  blastxml
  blaze-builder
  blaze-builder-enumerator
  blaze-html
  blaze-markup
  blaze-textual
  # bloodhound
  bloomfilter
  bmp
  bool-extras
  # boolsimplifier
  bound
  broadcast-chan
  bson
  # btrfs -- large
  buffer-builder
  bumper
  byteable
  bytedump
  byteorder
  bytes
  bytestring-builder
  bytestring-conversion
  bytestring-lexing
  bytestring-mmap
  bytestring-progress
  bytestring-trie
  bzlib
  bzlib-conduit
  # c2hs -- large
  # cabal-debian
  cabal-file-th
  cabal-install
  cabal-rpm
  # cabal-src -- large
  # cairo -- large
  # cartel -- large
  case-insensitive
  cases
  # cassava -- large
  cereal
  cereal-conduit
  cereal-vector
  cgi
  charset
  check-email
  checkers
  chell
  chell-quickcheck
  chunked-data
  cipher-aes
  cipher-aes128
  cipher-blowfish
  cipher-camellia
  cipher-des
  cipher-rc4
  circle-packing
  # clash-ghc
  # clash-lib -- depends on singletons
  # clash-prelude
  # clash-systemverilog
  # clash-verilog -- depends on singletons
  # clash-vhdl
  classy-prelude
  classy-prelude-conduit
  classy-prelude-yesod
  # clay -- large
  clientsession
  clock
  cmark
  cmdargs
  code-builder
  # codex -- large
  colour
  comonad
  comonad-transformers
  comonads-fd
  # compdata -- large
  composition
  composition-extra
  compressed
  concatenative
  concurrent-extra
  concurrent-supply
  conduit
  conduit-combinators
  conduit-extra
  configurator
  connection
  constraints
  consul-haskell
  containers-unicode-symbols
  contravariant
  control-bool
  control-monad-free
  control-monad-loop
  # convertible -- large
  cookie
  # country-codes -- fails to build
  courier
  cpphs
  cprng-aes
  cpu
  # cql -- large
  # cql-io -- large
  crackNum
  # criterion -- large
  cron
  crypto-api
  # crypto-api-tests -- large
  crypto-cipher-tests
  crypto-cipher-types
  crypto-numbers
  crypto-pubkey
  crypto-pubkey-types
  crypto-random
  crypto-random-api
  cryptocipher
  cryptohash
  cryptohash-conduit
  cryptohash-cryptoapi
  # cryptol -- large
  cryptonite
  css-text
  csv
  csv-conduit
  # cubicspline -- large
  # curl -- large
  data-accessor
  data-accessor-mtl
  data-binary-ieee754
  data-default
  data-default-class
  data-default-instances-base
  data-default-instances-containers
  data-default-instances-dlist
  data-default-instances-old-locale
  data-inttrie
  data-lens-light
  data-memocombinators
  data-ordlist
  data-reify
  datadog
  # dbus -- large
  # debian -- large
  deepseq-generics
  # derive -- large
  descriptive
  # diagrams -- large
  # diagrams-builder -- large
  # diagrams-cairo -- large
  # diagrams-contrib -- large
  # diagrams-core -- large
  # diagrams-html5 -- large
  # diagrams-lib -- large
  # diagrams-postscript -- large
  # diagrams-rasterific -- large
  diagrams-solve
  # diagrams-svg -- large
  digest
  digestive-functors
  # dimensional -- large
  # direct-sqlite -- large
  directory-tree
  disk-free-space
  distributive
  djinn-ghc
  djinn-lib
  dlist
  dlist-instances
  dns
  doctest
  double-conversion
  dual-tree
  easy-file
  # ede -- large
  edit-distance
  editor-open
  effect-handlers
  either
  elm-core-sources
  email-validate
  enclosed-exceptions
  engine-io
  engine-io-growler
  entropy
  enumerator
  eq
  erf
  errors
  esqueleto
  exception-mtl
  exception-transformers
  exceptional
  exceptions
  executable-hash
  executable-path
  expiring-cache-map
  extensible-exceptions
  extra
  fast-logger
  fay
  fay-base
  fay-builder
  fay-dom
  fay-jquery
  fay-text
  fay-uri
  # fb -- large
  # fb-persistent -- large
  fclabels
  # fdo-notify -- large
  feature-flags
  # feed -- large
  # fgl -- large
  file-embed
  file-location
  filemanip
  fingertree
  fingertree-psqueue
  fixed
  fixed-list
  flexible-defaults
  flock
  flow
  flowdock
  fmlist
  focus
  foldl
  # force-layout -- large
  foreign-store
  formatting
  free
  frisby
  fsnotify
  fuzzcheck
  gd
  generic-aeson
  generic-deriving
  generic-xmlpickler
  # generics-sop -- large
  # getopt-generics -- large
  # ghc-events -- large
  ghc-mtl
  ghc-paths
  ghc-syb-utils
  ghc-tcplugins-extra
  ghc-typelits-natnormalise
  ghcid
  # gio -- large
  # gipeda -- large
  # git-annex -- large
  git-embed
  gitlib
  # gitlib-libgit2 -- large
  gitlib-test
  gitrev
  # gl -- large
  # glib -- large
  gnuidn
  # gnutls -- large
  graph-core
  graph-wrapper
  graphs
  gravatar
  # groundhog -- large
  # groundhog-mysql -- large
  # groundhog-postgresql -- large
  # groundhog-sqlite -- large
  # groundhog-th -- large
  groupoids
  groups
  growler
  # gsasl -- large
  # gtk -- large
  gtk2hs-buildtools
  # gtk3 -- large
  # hPDB -- large
  # hPDB-examples -- large
  hackage-db
  # haddock-api -- large
  # haddock-library -- large
  # hakyll -- large
  half
  hamlet
  # happstack-server -- large
  happy
  hashable
  hashable-extras
  hashmap
  hashtables
  haskeline
  # haskell-lexer -- large
  # haskell-packages -- fails to build https://github.com/haskell-suite/haskell-packages/issues/23
  haskell-names
  # haskell-spacegoo -- large
  # haskell-src -- large
  haskell-src-exts
  haskell-src-meta
  # haskintex -- large
  # hasql -- large
  hasql-backend
  # hasql-postgres
  hastache
  # haxr -- large
  hdaemonize
  hdevtools
  # hdocs -- large
  heap
  heaps
  hebrew-time
  hedis
  heist
  here
  heredoc
  hex
  # hexpat -- large
  hexstring
  hflags
  # highlighting-kate -- large
  # hindent -- large
  hinotify
  hint
  # histogram-fill -- large
  # hit -- large
  hjsmin
  # hledger -- large
  # hledger-lib -- large
  # hledger-web -- large
  # hlibgit2 -- large
  # hlint -- large
  # hmatrix -- large
  # hmatrix-gsl -- large
  # hmatrix-gsl-stats -- fails to build
  # hmatrix-repa
  # hoauth2 -- fails to build
  holy-project
  hoogle
  hostname
  hostname-validate
  hourglass
  hpc-coveralls
  # hs-bibutils -- large
  hscolour
  hse-cpp
  # hsemail -- large
  # hsignal -- depends on hmatrix-gsl-stats
  hslogger
  hslua
  hspec
  hspec-attoparsec
  hspec-contrib
  hspec-core
  hspec-discover
  hspec-expectations
  hspec-jenkins
  hspec-meta
  hspec-smallcheck
  hspec-snap
  hspec-wai
  hspec-wai-json
  # hstatistics -- depends on hmatrix-gsl-stats
  hsyslog
  html
  html-conduit
  http-accept
  http-client
  http-client-tls
  http-common
  http-conduit
  http-date
  http-media
  http-reverse-proxy
  http-streams
  http-types
  http2
  # hweblib -- large
  hxt
  hxt-charproperties
  hxt-css
  # hxt-curl -- large
  # hxt-expat -- large
  hxt-http
  hxt-pickle-utils
  hxt-regex-xmlschema
  # hxt-relaxng -- large
  hxt-tagsoup
  hxt-unicode
  hyperloglog
  hyphenation
  # ide-backend -- large
  # ide-backend-common -- large
  ide-backend-rts
  # ide-backend-server -- large
  ieee754
  imagesize-conduit
  immortal
  include-file
  incremental-parser
  indents
  ini
  integration
  interpolate
  interpolatedstring-perl6
  intervals
  io-choice
  io-manager
  io-memoize
  io-streams
  iproute
  islink
  iterable
  # jmacro -- large
  # jmacro-rpc -- large
  # jmacro-rpc-happstack -- large
  # jmacro-rpc-snap -- large
  jose-jwt
  js-flot
  js-jquery
  json
  json-autotype
  json-builder
  json-schema
  jwt
  kan-extensions
  kdt
  # keter -- large
  keys
  kmeans
  koofr-client
  kure
  # language-c -- large
  # language-c-quote -- large
  language-ecmascript
  # language-glsl -- large
  language-haskell-extract
  # language-java -- large
  language-javascript
  largeword
  lattices
  lazy-csv
  lca
  lens
  lens-action
  lens-aeson
  lens-family
  lens-family-core
  lens-family-th
  lens-simple
  lexer-applicative
  lhs2tex
  libgit
  # libnotify -- large
  # librato -- depends on uri-templater
  libxml-sax
  lifted-async
  lifted-base
  # linear -- large
  # linear-accelerate -- large
  linux-file-extents
  linux-namespaces
  list-fusion-probe
  list-t
  loch-th
  log-domain
  logging-facade
  logict
  loop
  lrucache
  lucid
  lucid-svg
  lzma-conduit
  machines
  machines-directory
  machines-io
  machines-process
  mainland-pretty
  managed
  # mandrill -- large
  # mangopay
  map-syntax
  markdown
  markdown-unlit
  # markup -- large
  math-functions
  matrix
  maximal-cliques
  mbox
  memoize
  memory
  mersenne-random-pure64
  messagepack
  messagepack-rpc
  metrics
  mime-mail
  mime-mail-ses
  mime-types
  missing-foreign
  mmap
  mmorph
  monad-control
  monad-coroutine
  monad-extras
  monad-journal
  monad-logger
  monad-logger-json
  monad-logger-syslog
  monad-loops
  monad-par
  monad-par-extras
  monad-parallel
  monad-primitive
  monad-products
  monad-skeleton
  monad-st
  monad-stm
  monad-unlift
  monadLib
  monadcryptorandom
  monadic-arrays
  monads-tf
  # mongoDB -- large
  mono-traversable
  monoid-extras
  monoid-subclasses
  mtl
  mtl-compat
  mtl-prelude
  mtlparse
  multiarg
  multimap
  multipart
  mutable-containers
  mwc-random
  # mysql -- large
  # mysql-simple -- large
  nanospec
  nats
  ndjson-conduit
  neat-interpolation
  # nested-routes -- large
  netwire
  network
  network-anonymous-i2p
  network-anonymous-tor
  network-attoparsec
  network-conduit
  network-conduit-tls
  network-info
  network-multicast
  # network-protocol-xmpp -- large
  network-simple
  network-transport
  network-uri
  newtype
  newtype-generics
  nonce
  # nsis -- large
  numbers
  numeric-extras
  numtype
  objective
  old-locale
  old-time
  # opaleye -- large
  openpgp-asciiarmor
  openssl-streams
  operational
  options
  optparse-applicative
  optparse-simple
  # osdkeys -- large
  pager
  # pagerduty -- large
  # palette -- large
  # pandoc -- large
  # pandoc-citeproc -- large
  # pandoc-types -- large
  # pango -- large
  parallel
  parallel-io
  parseargs
  parsec
  parsers
  partial-handler
  path
  path-pieces
  patience
  pcre-heavy
  pcre-light
  # pdfinfo -- large
  pem
  persistent
  # persistent-mongoDB -- large
  # persistent-mysql --large
  persistent-postgresql
  persistent-refs
  persistent-sqlite
  persistent-template
  phantom-state
  # picoparsec -- depends on incremental-parser
  pipes
  pipes-aeson
  pipes-attoparsec
  pipes-binary
  pipes-bytestring
  pipes-concurrency
  pipes-group
  pipes-http
  pipes-network
  pipes-parse
  pipes-safe
  pipes-text
  pipes-wai
  placeholders
  # plot -- large
  # plot-gtk -- large
  # plot-gtk3 -- large
  pointed
  # poly-arity
  polyparse
  posix-realtime
  post-mess-age
  postgresql-binary
  postgresql-libpq
  postgresql-simple
  # pred-trie -- large
  prednote
  prefix-units
  prelude-extras
  presburger
  pretty-class
  # pretty-show -- large
  prettyclass
  primes
  primitive
  process-extras
  product-profunctors
  profunctor-extras
  profunctors
  project-template
  psqueues
  pure-io
  pureMD5
  pwstore-fast
  quandl-api
  quickcheck-assertions
  quickcheck-instances
  quickcheck-io
  quickcheck-unicode
  rainbow
  random
  # random-fu -- large
  random-shuffle
  random-source
  # rasterific-svg -- large
  raw-strings-qq
  # redis-io -- large
  # redis-resp -- large
  reducers
  ref-fd
  reflection
  regex-applicative
  regex-base
  regex-compat
  regex-pcre
  regex-pcre-builtin
  regex-posix
  # regex-tdfa -- large
  regex-tdfa-rc
  regexpr
  # repa -- large
  # repa-algorithms -- large
  # repa-devil -- large
  # repa-io -- large
  reroute
  resource-pool
  resourcet
  # rest-client -- large
  # rest-core -- large
  # rest-gen -- large
  # rest-happstack -- large
  # rest-snap -- large
  rest-stringmap
  # rest-types -- large
  # rest-wai -- large
  rethinkdb-client-driver
  retry
  rev-state
  # rfc5051 -- large
  runmemo
  rvar
  safe
  safecopy
  sandi
  # sbv -- large
  # scalpel -- large
  scientific
  scotty
  # sdl2 -- large
  # second-transfer -- linker failure
  securemem
  semigroupoid-extras
  semigroupoids
  semigroups
  semver
  sendfile
  seqloc
  serf
  servant
  servant-client
  servant-docs
  # servant-jquery -- fails  to build
  servant-server
  set-extra
  set-monad
  setenv
  setlocale
  shake
  # shake-language-c -- large
  shakespeare
  shakespeare-text
  shell-conduit
  # shelltestrunner -- large
  # shelly -- large
  silently
  simple-reflect
  simple-sendfile
  singletons
  siphash
  skein
  slave-thread
  smallcheck
  # smoothie -- large
  # smtLib -- large
  snap
  snap-core
  snap-server
  snaplet-fay
  snmp
  snowflake
  socket-io
  socks
  sodium
  sourcemap
  speculation
  # sphinx -- large
  splice
  split
  spoon
  # sqlite-simple -- large
  srcloc
  stackage
  stackage-build-plan
  stackage-cabal
  stackage-cli
  stackage-install
  stackage-metadata
  stackage-sandbox
  stackage-setup
  stackage-types
  stackage-update
  stackage-upload
  stateref
  statestack
  static-canvas
  # statistics -- large
  # statistics-linreg -- large
  stm
  stm-chans
  stm-conduit
  stm-containers
  stm-delay
  stm-stats
  storable-complex
  storable-endian
  streaming-commons
  strict
  string-conversions
  stringable
  stringbuilder
  stringsearch
  stylish-haskell
  # svg-tree -- large
  swagger
  syb
  symbol
  system-fileio
  system-filepath
  system-posix-redirect
  tabular
  tagged
  tagged-binary
  tagshare
  tagsoup
  tagstream-conduit
  tar
  tardis
  tasty
  tasty-ant-xml
  tasty-golden
  tasty-hspec
  tasty-hunit
  tasty-kat
  tasty-quickcheck
  tasty-rerun
  # tasty-silver -- large
  tasty-smallcheck
  tasty-th
  temporary
  temporary-rc
  terminal-progress-bar
  terminal-size
  terminfo
  test-framework
  test-framework-hunit
  test-framework-quickcheck2
  test-framework-th
  testing-feat
  # texmath -- large
  text
  text-binary
  text-format
  # text-icu -- large
  text-manipulate
  tf-random
  # th-desugar -- large
  th-expand-syns
  th-extras
  th-lift
  th-orphans
  th-reify-many
  threads
  through-text
  thumbnail-plus
  thyme
  time-compat
  time-lens
  time-locale-compat
  timezone-olson
  timezone-series
  tinylog
  tls
  tls-debug
  torrent
  tostring
  transformers-base
  transformers-compat
  traverse-with-class
  tree-view
  trifecta
  # tttool -- large
  # tuples-homogenous-h98 -- large
  turtle
  type-eq
  # type-list -- depends on singletons
  # unbound-generics -- large
  unbounded-delays
  union-find
  uniplate
  unix-compat
  unix-time
  unordered-containers
  uri-bytestring
  uri-encode
  # uri-templater -- fails to build https://github.com/iand675/uri-templater/pull/3
  url
  urlpath
  users
  users-postgresql-simple
  users-test
  utf8-light
  utf8-string
  uu-interleaved
  # uu-parsinglib -- large
  uuid
  uuid-types
  vault
  vector
  vector-algorithms
  vector-binary-instances
  vector-buffer
  vector-instances
  vector-space
  vector-space-points
  vector-th-unbox
  vhd
  void
  wai
  wai-app-static
  wai-conduit
  wai-cors
  wai-eventsource
  wai-extra
  wai-handler-launch
  wai-logger
  # wai-middleware-consul
  wai-middleware-crowd
  wai-middleware-static
  wai-predicates
  wai-route
  wai-routes
  wai-routing
  wai-util
  wai-websockets
  # waitra -- test fail
  warp
  warp-tls
  # web-fpco -- large
  webpage
  websockets
  witherable
  wizards
  wl-pprint
  wl-pprint-extras
  wl-pprint-terminfo
  wl-pprint-text
  word8
  # wordpass -- large
  wrap
  wreq
  x509
  x509-store
  x509-system
  x509-validation
  xenstore
  xhtml
  xml
  xml-conduit
  xml-hamlet
  xml-lens
  # xml-to-json -- large
  xml-to-json-fast
  xml-types
  xmlgen
  xmlhtml
  xss-sanitize
  yackage
  yaml
  yesod
  yesod-auth
  yesod-auth-deskcom
  # yesod-auth-fb -- large
  yesod-auth-hashdb
  yesod-auth-oauth
  # yesod-auth-oauth2 -- depends on hoauth2
  yesod-bin
  yesod-core
  yesod-default
  # yesod-eventsource -- depends on wai-eventsource
  yesod-fay
  # yesod-fb -- large
  yesod-form
  yesod-gitrepo
  yesod-gitrev
  # yesod-mangopay -- depends on shakespeare-css
  yesod-newsfeed
  yesod-persistent
  yesod-sitemap
  yesod-static
  yesod-test
  yesod-text-markdown
  yesod-websockets
  zeromq4-haskell
  zip-archive
  zlib
  zlib-bindings
  zlib-enum
  zlib-lens
]
