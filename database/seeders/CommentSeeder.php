<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class CommentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $comments    =
        [
            [
                'fecha'         => date('Y-m-d'),
                'comentario'    => 'EXCELENTE COMIDA, MUY RIQUISIMA',
            ], 
            [
                'fecha'         => date("Y-m-d",strtotime(date('Y-m-d')."-1 days")),
                'comentario'    => 'ME ENCANTAN SUS ALITAS A LA BBQ!!!',
            ],  
            [
                'fecha'         => date("Y-m-d",strtotime(date('Y-m-d')."-2 days")),
                'comentario'    => 'LA COMIDA ES BUENISIMA, LO RECOMIENDO MUCHISIMO',
            ],    
            [
                'fecha'         => date("Y-m-d",strtotime(date('Y-m-d')."-3 days")),
                'comentario'    => 'LOS VISITO CADA FIN DE SEMANA, BENDICIONES',
            ],       
        ];

        foreach($comments as $comment)
        {
            $new_comment = new \App\Models\Comment();
            foreach($comment as $k => $value)
            {
                $new_comment->{$k} = $value;
            }

            $new_comment->save();
        }
    }
}
