export OP_PLUGIN_ALIASES_SOURCED=1

fly() {
	op plugin run -- fly "$@"
}

flyctl() {
	op plugin run -- flyctl "$@"
}
