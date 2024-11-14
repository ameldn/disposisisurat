<div>
    <div class="min-h-screen bg-white dark:bg-slate-800 dark:!text-white p-3">
        <div class="h-[20vh]"></div>
        @if (filament()->hasRegistration())
            <x-slot name="subheading">
                {{ __('filament-panels::pages/auth/login.actions.register.before') }}

                {{ $this->registerAction }}
            </x-slot>
        @endif

        {{ \Filament\Support\Facades\FilamentView::renderHook('panels::auth.login.form.before') }}

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-3 container mx-auto">
            <div class="card dark:shadow dark:shadow-white">
                <x-filament-panels::form wire:submit="authenticate" class="card-body">
                    <h1 class="text-center font-black text-xl uppercase">Login</h1>
                    {{ $this->form }}

                    <x-filament-panels::form.actions :actions="$this->getCachedFormActions()" :full-width="$this->hasFullWidthFormActions()" />

                    {{-- <x-filament::button wire:click="$this->getCachedFormActions()">
                        Login
                    </x-filament::button> --}}
                </x-filament-panels::form>
            </div>

            <div class="flex justify-center">
                <img src="/images/rubik.png" class="w-1/2 object-contain" />
            </div>
        </div>

        {{ \Filament\Support\Facades\FilamentView::renderHook('panels::auth.login.form.after') }}
    </div>
</div>
