import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_petition_demo/blocs/petition_bloc/petition_bloc.dart';
import 'package:in_time_petition_demo/components/appbar.dart';
import 'package:in_time_petition_demo/core/utils.dart';
import 'package:in_time_petition_demo/model/country.dart';
import 'package:in_time_petition_demo/screens/petition_screen/no_countries_found.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/animated_button.dart';

class PetitionScreen extends StatelessWidget {
  PetitionScreen({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  final _bloc = PetitionBloc();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider.value(
            value: _bloc,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppbar(
                  title: "Petition",
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  trailing: Icons.close_rounded,
                  onTrailingTap: () {
                    Utils.mainNavigatorKey.currentState?.pop();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        CupertinoSearchTextField(
                          controller: _textController,
                          onSuffixTap: () {
                            _textController.clear();
                            _onQueryChanged("");
                          },
                          onChanged: _onQueryChanged,
                          onSubmitted: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: BlocBuilder<PetitionBloc, PetitionState>(
                            builder: (context, state) {
                              if (state is CountriesLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is CountriesListUpdated) {
                                if (state.countries.isNotEmpty) {
                                  return _buildCountriesList(state.countries);
                                } else {
                                  return _buildNoCountriesFound(
                                      _textController.value.text);
                                }
                              }
                              return Container();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountriesList(List<Country> countries) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          ...countries
              .map(
                (country) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: AnimatedButton(
                    onTap: () {
                      launch(country.url);
                    },
                    child: Text(
                      country.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          letterSpacing: 0.9,
                          color: Color(0xff3683FC)),
                    ),
                  ),
                ),
              )
              .toList(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void _onQueryChanged(String query) {
    if (_bloc.state is! CountriesLoading) {
      EasyDebounce.debounce("new_query", const Duration(milliseconds: 100), () {
        _bloc.add(FindCountriesByQuery(query));
      });
    } else {
      _textController.text = "";
    }
  }

  Widget _buildNoCountriesFound(String query) {
    return Center(child: NoCountriesFoundSubScreen(query));
  }
}
