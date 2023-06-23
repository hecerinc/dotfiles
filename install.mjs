#!/usr/bin/env zx

const homeDir = os.homedir();

// vim-plug
// --------------------------------------------------
console.log(chalk.blue("Checking if vim-plug exists..."));
if (fs.existsSync(`${homeDir}/.vim/autoload/plug.vim`)) {
	console.log(chalk.green("You already have vim-plug, awesome!"));
} else {
	console.log(chalk.red("Nope, installing vim-plug"));

	await $`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`;
}

// Ripgrep
// --------------------------------------------------
console.log(chalk.blue("Checking if rg exists..."));
try {
	await $`which rg`;
	console.log(chalk.green("You already have rg, awesome!"));
} catch {
	console.log(chalk.red("Nope, installing rg (rigrep)"));

	// Debian-based stuff
	await $`sudo apt install -y ripgrep`;
}

// ZSH
// --------------------------------------------------
console.log(chalk.blue("Checking if zsh is installed"));
try {
	await $`which zsh`;
	console.log(chalk.green("You already have zsh, awesome!"));
} catch (p) {
	console.log(chalk.red("Nope, installing zsh"));

	await $`sudo apt install -y zsh`;
}

// Oh-my-zsh
// --------------------------------------------------
console.log(chalk.blue("Checking if oh-my-zsh is installed"));
if (fs.existsSync(`${homeDir}/.oh-my-zsh/themes/README.md`)) {
	console.log(chalk.green("You already have oh-my-zsh, awesome!"));
} else {
	console.log(chalk.red("Nope, installing oh-my-zsh"));

	await $`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`;

	// spaceship-prompt
	// --------------------------------------------------
	await $`git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`;
	await $`ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`;

	await $`sed -i s/robbyrussell/spaceship/ ~/.zshrc`;
}

// .vimrc
// --------------------------------------------------
console.log(chalk.blue("Copying .vimrc to ~/.vimrc"));
await nothrow($`cp -i .vimrc ~/.vimrc`);

// .gitconfig
// --------------------------------------------------
console.log(chalk.blue("Copying .gitconfig to ~/.gitconfig"));
await nothrow($`cp -i .gitconfig ~/.gitconfig`);

console.log(chalk.blue("Copying .zsh-aliases to ~/.zsh-aliases"));
await nothrow($`cp -i .zsh-aliases ~/.zsh-aliases`);

fs.readFileSync(`${homeDir}/.zshrc`, async (err, data) => {
	if (err) throw err;
	if (data.includes("zsh-aliases")) {
		console.log(
			chalk.green("~/.zshrc contains .zsh-alises so I'm not adding it")
		);
	} else {
		console.log(chalk.red("Adding .zsh-aliases to ~/.zshrc"));
		await $`echo "source ~/.zsh-aliases" >> ~/.zshrc`;
	}
});
