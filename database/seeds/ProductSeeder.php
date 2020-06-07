<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       /* $products=['Ürün 1','Ürün 2','Ürün 3','Ürün 4'];
        foreach($products as $product){
          DB::table('products')->insert([
            'name'=>$product,
            'slug'=>str_slug($product),
            'content'=>"Ürün Detay",
            'created_at'=>now(),
            'updated_at'=>now()
          ]);
        } 
        */

        $faker=Faker::create();
        for($i=0;$i<10;$i++){
            $title=$faker->name;
            $slug = Str::slug($title, '-');
          DB::table('products')->insert([
            'name'=>$title,
            'image'=>$faker->imageUrl(800, 400, 'cats', true),
            'content'=>$faker->paragraph(6),
            'slug'=>$slug,
            'created_at'=>$faker->dateTime('now'),
            'updated_at'=>now()
          ]);
        }
    }
}
