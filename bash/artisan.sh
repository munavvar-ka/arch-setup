# Artisan
alias art='php artisan'
alias arts='php artisan serve'

# Make command aliases
alias artmamo='php artisan make:model'
alias artmaco='php artisan make:controller'
alias artmali='php artisan make:livewire'
alias artmafa='php artisan make:factory'
alias artmase='php artisan make:seeder'
alias artmami='php artisan make:migration'
alias artmarr='php artisan make:request'
artma(){
    php artisan make:$@
}

# Artisan migration aliases
alias artmi='php artisan migrate'
alias artmifr='php artisan migrate:fresh'
alias artmire='php artisan migrate:refresh'
alias artmirt='php artisan migrate:reset'
alias artmirb='php artisan migrate:rollback'
alias artmist='php artisan migrate:status'

# Artisan sedder aliases
alias artdbs='php artisan db:seed'
artdbsc(){
    php artisan db:seed --class=$1
}

# Artisan tenant
artte(){
    php artisan tenant:artisan $1
}
