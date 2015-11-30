# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Productos" do
    describe "Admin" do
      describe "productos", type: :feature do
        refinery_login

        describe "productos list" do
          before do
            FactoryGirl.create(:producto, :nombre => "UniqueTitleOne")
            FactoryGirl.create(:producto, :nombre => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.productos_admin_productos_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.productos_admin_productos_path

            click_link "Add New Producto"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Nombre", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Productos::Producto, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Productos::Producto, :count)

              expect(page).to have_content("Nombre can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:producto, :nombre => "UniqueTitle") }

            it "should fail" do
              visit refinery.productos_admin_productos_path

              click_link "Add New Producto"

              fill_in "Nombre", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Productos::Producto, :count)

              expect(page).to have_content("There were problems")
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.productos_admin_productos_path
                click_link "Add New Producto"
                fill_in "Nombre", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                expect(Refinery::Productos::Producto.count).to eq(1)
              end

              it "should show locale marker for page" do
                p = Refinery::Productos::Producto.last
                within "#producto_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'EN')
                end
              end

              it "should show nombre in the admin menu" do
                p = Refinery::Productos::Producto.last
                within "#producto_#{p.id}" do
                  expect(page).to have_content('First column')
                end
              end
            end

            describe "add a producto with title for primary and secondary locale" do
              before do
                visit refinery.productos_admin_productos_path
                click_link "Add New Producto"
                fill_in "Nombre", :with => "First column"
                click_button "Save"

                visit refinery.productos_admin_productos_path
                within ".actions" do
                  click_link "Edit this producto"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "Nombre", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                expect(Refinery::Productos::Producto.count).to eq(1)
                expect(Refinery::Productos::Producto::Translation.count).to eq(2)
              end

              it "should show locale flag for page" do
                p = Refinery::Productos::Producto.last
                within "#producto_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'EN')
                  expect(page).to have_css(".locale_marker", content: 'CS')
                end
              end

              it "should show nombre in backend locale in the admin menu" do
                p = Refinery::Productos::Producto.last
                within "#producto_#{p.id}" do
                  expect(page).to have_content('First column')
                end
              end
            end

            describe "add a nombre with title only for secondary locale" do
              before do
                visit refinery.productos_admin_productos_path
                click_link "Add New Producto"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "Nombre", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Productos::Producto.last
                within "#producto_#{p.id}" do
                  expect(page).to have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::Productos::Producto.last
                within "#producto_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'CS')
                end
              end
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:producto, :nombre => "A nombre") }

          it "should succeed" do
            visit refinery.productos_admin_productos_path

            within ".actions" do
              click_link "Edit this producto"
            end

            fill_in "Nombre", :with => "A different nombre"
            click_button "Save"

            expect(page).to have_content("'A different nombre' was successfully updated.")
            expect(page).not_to have_content("A nombre")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:producto, :nombre => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.productos_admin_productos_path

            click_link "Remove this producto forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Productos::Producto.count).to eq(0)
          end
        end

      end
    end
  end
end
