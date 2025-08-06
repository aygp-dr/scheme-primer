# Project Configuration
PROJECT_NAME := scheme-primer
PROJECT_ROOT := $(shell pwd)

# Export for subshells and tmux sessions
export PROJECT_NAME
export PROJECT_ROOT

# Default target
.PHONY: help
help:
	@echo "Scheme Primer Development Environment"
	@echo ""
	@echo "Available targets:"
	@echo "  dev        - Start tmux session with Emacs configured for Scheme"
	@echo "  emacs      - Start Emacs with project configuration"
	@echo "  repl       - Start Guile REPL"
	@echo "  test       - Run all tests"
	@echo "  clean      - Clean generated files"
	@echo ""
	@echo "Project: $(PROJECT_NAME)"
	@echo "Root: $(PROJECT_ROOT)"

# Start development environment with tmux and Emacs
.PHONY: dev
dev: $(PROJECT_NAME).el
	@echo "Starting development environment for $(PROJECT_NAME)..."
	@if tmux has-session -t $(PROJECT_NAME) 2>/dev/null; then \
		echo "Session $(PROJECT_NAME) already exists. Attaching..."; \
		tmux attach-session -t $(PROJECT_NAME); \
	else \
		tmux new-session -d -s $(PROJECT_NAME) "emacs -nw -Q -l $(PROJECT_NAME).el"; \
		echo "Created tmux session: $(PROJECT_NAME)"; \
		echo "TTY: $$(tmux list-panes -t $(PROJECT_NAME) -F '#{pane_tty}')"; \
		tmux attach-session -t $(PROJECT_NAME); \
	fi

# Start Emacs with project configuration
.PHONY: emacs
emacs: $(PROJECT_NAME).el
	emacs -nw -Q -l $(PROJECT_NAME).el

# Start Guile REPL
.PHONY: repl
repl:
	guile --listen

# Run tests
.PHONY: test
test:
	@echo "Running Scheme tests..."
	@for test in cons/cons-tests.scm faster-miniKanren/test-all.scm; do \
		if [ -f $$test ]; then \
			echo "Running $$test..."; \
			guile $$test || true; \
		fi; \
	done

# Clean generated files
.PHONY: clean
clean:
	find . -name "*.go" -delete
	find . -name "*~" -delete

# Show tmux session info
.PHONY: tmux-info
tmux-info:
	@if tmux has-session -t $(PROJECT_NAME) 2>/dev/null; then \
		echo "Session: $(PROJECT_NAME)"; \
		echo "TTY: $$(tmux list-panes -t $(PROJECT_NAME) -F '#{pane_tty}')"; \
		tmux list-windows -t $(PROJECT_NAME); \
	else \
		echo "No tmux session '$(PROJECT_NAME)' found"; \
	fi

# Kill tmux session
.PHONY: tmux-kill
tmux-kill:
	@if tmux has-session -t $(PROJECT_NAME) 2>/dev/null; then \
		tmux kill-session -t $(PROJECT_NAME); \
		echo "Killed tmux session: $(PROJECT_NAME)"; \
	else \
		echo "No tmux session '$(PROJECT_NAME)' to kill"; \
	fi