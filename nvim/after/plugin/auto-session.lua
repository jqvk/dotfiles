require('auto-session').setup {
	log_level = vim.log.levels.ERROR,
  auto_session_root_dir = '/home/taylor/.nvimsessions/',
  session_lens = {
    load_on_setup = false,
  },
}
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
