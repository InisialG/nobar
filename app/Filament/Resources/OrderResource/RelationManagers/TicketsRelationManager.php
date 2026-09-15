<?php

namespace App\Filament\Resources\OrderResource\RelationManagers;

use Filament\Actions\AssociateAction;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\DissociateAction;
use Filament\Actions\DissociateBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class TicketsRelationManager extends RelationManager
{
    protected static string $relationship = 'tickets';

    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('ticket_code')
                    ->label('Kode Tiket')
                    ->disabled()
                    ->maxLength(255),
                TextInput::make('participant_name')
                    ->label('Nama Peserta')
                    ->disabled(),
                TextInput::make('participant_organization')
                    ->label('Organisasi')
                    ->disabled(),
                Select::make('seat_availability_id')
                    ->label('Tugaskan Kursi (Misal: VVIP / Reguler)')
                    ->options(function (RelationManager $livewire, ?\App\Models\Ticket $record) {
                        $order = $livewire->getOwnerRecord();
                        $seats = \App\Models\SeatAvailability::with('seatMaster.seatCategory')
                            ->where('event_session_id', $order->event_session_id)
                            ->where(function($q) use ($record) {
                                $q->where('status', 'available');
                                if ($record && $record->seat_availability_id) {
                                    $q->orWhere('id', $record->seat_availability_id);
                                }
                            })
                            ->get()
                            ->mapWithKeys(function($seat) {
                                $catName = $seat->seatMaster?->seatCategory?->name ?? 'Unknown';
                                $code = $seat->seatMaster?->seat_code ?? '-';
                                return [$seat->id => "{$code} - {$catName}"];
                            });
                        return $seats;
                    })
                    ->searchable()
                    ->nullable(),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('ticket_code')
            ->columns([
                TextColumn::make('ticket_code')
                    ->label('Kode Tiket')
                    ->searchable(),
                TextColumn::make('participant_name')
                    ->label('Nama Peserta')
                    ->searchable(),
                TextColumn::make('seatAvailability.seatMaster.seat_code')
                    ->label('Nomor Kursi')
                    ->default('Belum Ditentukan')
                    ->badge(),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                // No create action for tickets manually here
            ])
            ->recordActions([
                EditAction::make()
                    ->after(function (\App\Models\Ticket $record) {
                        if ($record->seat_availability_id) {
                            \App\Models\SeatAvailability::where('id', $record->seat_availability_id)->update([
                                'status' => 'sold',
                                'order_id' => $record->order_id,
                            ]);
                        }
                    }),
            ])
            ->toolbarActions([
                //
            ]);
    }
}
