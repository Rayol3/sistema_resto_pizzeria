<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DetailPublicitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $details =
        [
            [
                'imagen'   => 'publicity-1.jpg',
            ],
            [
                'imagen'   => 'publicity-2.png',
            ],
            [
                'imagen'   => 'publicity-3.png',
            ],
        ];

        foreach($details as $publicity)
        {
            $new_publicity = new \App\Models\DetailPublicity();
            foreach($publicity as $key => $value)
            {
                $new_publicity->{$key}  = $value;
            }

            $new_publicity->save();
        }
    }
}
